<?php

namespace App\Controllers\Admin;

use App\Models\Relay;
use App\Models\Node;
use App\Models\User;
use App\Services\Auth;
use App\Controllers\AdminController;

class RelayController extends AdminController
{
	public function index($request, $response, $args){
		$pageNum = 1;
		if (isset($request->getQueryParams()["page"])) {
			$pageNum = $request->getQueryParams()["page"];
		}
		$logs = Relay::paginate(15, ['*'], 'page', $pageNum);
		$logs->setPath('/admin/relay');
		return $this->view()->assign('rules',$logs)->display('admin/relay/index.tpl');
	}

	public function create($request, $response, $args){
		$user = Auth::getUser();
		$source_nodes = Node::where('type', 1)->where('sort',10)->orderBy('name')->get();
		
		$dist_nodes = Node::where('type', 1)->where('sort',0)->orderBy('name')->get();
		
		
		return $this->view()->assign('source_nodes', $source_nodes)->assign('dist_nodes', $dist_nodes)->display('admin/relay/add.tpl');
	}

	public function add($request, $response, $args){
		
		$dist_node_id = $request->getParam('dist_node');
		$source_node_id = $request->getParam('source_node');
		$port = $request->getParam('port');
		$priority = $request->getParam('priority');
		$user_id = $request->getParam('user_id');
		
		$source_node = Node::where('id', $source_node_id)->first();
		if($source_node == NULL && $source_node_id != 0)
		{
			$rs['ret'] = 0;
			$rs['msg'] = "美国的华莱士";
			return $response->getBody()->write(json_encode($rs));
		}
		
		$dist_node = Node::where('id', $dist_node_id)->first();
		if($dist_node == NULL)
		{
			$rs['ret'] = 0;
			$rs['msg'] = "不知道比你们高到哪里去了";
			return $response->getBody()->write(json_encode($rs));
		}
		
		$user = User::where('id', $user_id)->first();
		if($user == NULL)
		{
			$rs['ret'] = 0;
			$rs['msg'] = "你们还要提高自己的姿势水平啊";
			return $response->getBody()->write(json_encode($rs));
		}
		
		
		$rule = new Relay();
		$rule->user_id = $user->id;
		$rule->dist_node_id = $dist_node_id;
		$rule->dist_ip = $dist_node->node_ip;
		$rule->source_node_id = $source_node_id;
		$rule->port = $port;
		$rule->priority = $priority;

		if(!$rule->save()){
			$rs['ret'] = 0;
			$rs['msg'] = "添加失败";
			return $response->getBody()->write(json_encode($rs));
		}
	
		$rs['ret'] = 1;
		$rs['msg'] = "添加成功";
		return $response->getBody()->write(json_encode($rs));
	}

	public function edit($request, $response, $args){
		$id = $args['id'];
		
		$user = Auth::getUser();
		$rule = Relay::where('id', $id)->first();
		
		if($rule == NULL)
		{
			exit(0);
		}
		
		$source_nodes = Node::where('type', 1)->where('sort',10)->orderBy('name')->get();
		
		$dist_nodes = Node::where('type', 1)->where('sort',0)->orderBy('name')->get();
		
		return $this->view()->assign('rule',$rule)->assign('source_nodes', $source_nodes)->assign('dist_nodes', $dist_nodes)->display('admin/relay/edit.tpl');
	}

	public function update($request, $response, $args){
		$id = $args['id'];
		$rule = Relay::where('id', $id)->first();
		
		if($rule == NULL)
		{
			exit(0);
		}

		$dist_node_id = $request->getParam('dist_node');
		$source_node_id = $request->getParam('source_node');
		$port = $request->getParam('port');
		$user_id = $request->getParam('user_id');
		$priority = $request->getParam('priority');
		
		$source_node = Node::where('id', $source_node_id)->first();
		if($source_node == NULL && $source_node_id != 0)
		{
			$rs['ret'] = 0;
			$rs['msg'] = "美国的华莱士";
			return $response->getBody()->write(json_encode($rs));
		}
		
		$dist_node = Node::where('id', $dist_node_id)->first();
		if($dist_node == NULL)
		{
			$rs['ret'] = 0;
			$rs['msg'] = "不知道比你们高到哪里去了";
			return $response->getBody()->write(json_encode($rs));
		}
		
		$user = User::where('id', $user_id)->first();
		if($user == NULL)
		{
			$rs['ret'] = 0;
			$rs['msg'] = "你们还要提高自己的姿势水平啊";
			return $response->getBody()->write(json_encode($rs));
		}
		
		
		$rule->user_id = $user->id;
		$rule->dist_node_id = $dist_node_id;
		$rule->dist_ip = $dist_node->node_ip;
		$rule->source_node_id = $source_node_id;
		$rule->port = $port;
		$rule->priority = $priority;
		
		
		if(!$rule->save()){
			$rs['ret'] = 0;
			$rs['msg'] = "修改失败";
			return $response->getBody()->write(json_encode($rs));
		}
		
		$rs['ret'] = 1;
		$rs['msg'] = "修改成功";
		return $response->getBody()->write(json_encode($rs));
	}


	public function delete($request, $response, $args){
		$id = $request->getParam('id');
		$user = Auth::getUser();
		$rule = Relay::where('id', $id)->first();
		
		if($rule == NULL)
		{
			exit(0);
		}
		
		if(!$rule->delete()){
			$rs['ret'] = 0;
			$rs['msg'] = "删除失败";
			return $response->getBody()->write(json_encode($rs));
		}
		$rs['ret'] = 1;
		$rs['msg'] = "删除成功";
		return $response->getBody()->write(json_encode($rs));
	}

}
