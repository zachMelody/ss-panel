<footer>
    <div class="container text-center" style="position: fixed;left: 0;bottom: 0;width: 100%;z-index: 9999;background-color: white;">
        <p>&copy; 2016 Way To ShadowSock | <a href="/tos">Terms of Service</a> | Powered by ss-panel-v3</p>
    </div>
</footer>
<script src="//cdn.staticfile.org/jquery/2.2.1/jquery.min.js"></script>
<script src="/theme/material/js/base.min.js"></script>
<script src="/theme/material/js/project.min.js"></script>
<script src="/theme/material/js/script.js"></script>
<script>
    $(document).ready(function () {
        $("#nav a[href$='/user/node']").each(function () {
            $(this).parent().addClass('active');
            var $parentLi = $(this).parent().parent().parent();
            if ($parentLi.parent().hasClass("nav")) {
                $parentLi.addClass('active');
            }
        });
    });
</script>
</body>
</html>
