<?php
function GetPositionByIP($ip){
        $headers = array(
                'User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN; rv:1.9) Gecko/2008052906 Firefox/3.0',
                'Referer: http://lbsyun.baidu.com/skins/MySkin/resources/iframs/heightAccApi.html'
        );
        $ch = curl_init();
        curl_setopt($ch,CURLOPT_URL,"http://api.map.baidu.com/highacciploc/v1?ak=dyPcBVF2TUAYldcFspcLmmNMi6P34f47&qterm=pc&callback_type=json&coord=bd09ll&qcip=".urlencode($ip));
        curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
        curl_setopt($ch,CURLOPT_HTTPHEADER,$headers);
          $data = curl_exec($ch);
          curl_close($ch);
        if($data = json_decode($data,true)){
                if(isset($data['result'])){
                        if($data['result']['error'] != 161){
                                return false;
                        }else{
                                return $data['content']['location'];
                        }
                }else{
                        return false;
                }
        }else{
                return false;
        }
}

function GetMapPicByPosition($parray){
        $lat = urlencode($parray['lat']);
        $lng = urlencode($parray['lng']);
        $headers = array(
                'User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN; rv:1.9) Gecko/2008052906 Firefox/3.0',
                'Referer: http://developer.baidu.com/map/skins/MySkin/resources/iframs/static-1.html'
        );
        $ch = curl_init();
        curl_setopt($ch,CURLOPT_URL,"http://api.map.baidu.com/staticimage/v2?ak=E4805d16520de693a3fe707cdc962045&width=800&height=600&center={$lng},{$lat}&labels={$lng},{$lat}&zoom=15&labelStyles=Here,1,11,0xffffff,0x000fff,1");
        curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
        curl_setopt($ch,CURLOPT_HTTPHEADER,$headers);
        $data = curl_exec($ch);
        curl_close($ch);
        if(json_decode($data,true)){
                return false;
        }else{
                return $data;
        }
}

function GetAddressByPosition($parray){
        $lat = urlencode($parray['lat']);
        $lng = urlencode($parray['lng']);
        $headers = array(
                'User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN; rv:1.9) Gecko/2008052906 Firefox/3.0',
                'Referer: http://lbsyun.baidu.com/index.php?title=webapi/guide/webservice-geocoding'
        );
        $ch = curl_init();
        curl_setopt($ch,CURLOPT_URL,"http://api.map.baidu.com/geocoder/v2/?ak=E4805d16520de693a3fe707cdc962045&location={$lat},{$lng}&output=json&pois=0");
        curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
        curl_setopt($ch,CURLOPT_HTTPHEADER,$headers);
        $data = curl_exec($ch);
        curl_close($ch);
        if($data = json_decode($data,true)){
                if($data['status'] != 0){
                        return false;
                }else{
                        return $data['result']['formatted_address'];
                }
        }else{
                return false;
        }
}
if(isset($_GET['ip']) && filter_var($_GET['ip'],FILTER_VALIDATE_IP)){
  $pos = GetPositionByIP($_GET['ip']);
}else{
  $pos = GetPositionByIP($_SERVER['REMOTE_ADDR']);
}
if($pos){
  $img = base64_encode(GetMapPicByPosition($pos));
  echo '<img src="data:image/png;base64,'.$img.'">';
  echo GetAddressByPosition($pos);
}else{
  echo 'CAN NOT FETCH DATA';
}