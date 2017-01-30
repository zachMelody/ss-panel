<footer>
    <div class="container text-center">
        <p>&copy; 2016 Way To ShadowSock | <a href="/tos">Terms of Service</a> | Powered by ss-panel-v3</p>
    </div>
</footer>
<script src="//cdn.staticfile.org/jquery-validate/1.15.0/jquery.validate.min.js"></script>
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
<script src="//cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.5.16/clipboard.min.js"></script>
</body>
</html>
