<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>植物应用素材库</title>
    <!--     <link rel="stylesheet" href="http://localhost/plants/plants/statics/default/css/style.css">
<script src="http://localhost/plants/plants/statics/default/js/jquery-1.8.3.min.js"></script> -->
    <link rel="stylesheet" href="<?php echo HOME_THEME_PATH; ?>css/style.css">
    <script src="<?php echo HOME_THEME_PATH; ?>js/jquery-1.8.3.min.js"></script>
    <script>
        $(document).ready(function() {

            //alert(name);
            cxl("<?=$_GET['shx']?>");
            cxl("<?=$_GET['shhj']?>");
            cxl("<?=$_GET['hs']?>");
            cxl("<?=$_GET['gstx']?>");
            cxl("<?=$_GET['jixiang']?>");
            cxl("<?=$_GET['qhlx']?>");

            function cxl(name) {
                if (name) {
                    name1 = name.split(','); //将字符串转换为数组
                    for (var i = 0; i < name1.length; i++) {
                        $("." + name1[i]).parent('li').addClass("selected");
                    }
                }
            }
            $("#select").find("li").click(function() {

//                if ($(this).parent('ul').attr('id') == "select4") {
//                    if (!$(this).attr('class')) {
//                        $(this).addClass("selected");
//                    } else {
//                        $(this).removeClass("selected");
//                    }
//                } else {
//                    $(this).addClass("selected").siblings().removeClass("selected");
//                }

                if($(this).hasClass("select-all"))
                {
                    if(!$(this).hasClass("selected"))
                    {
                        $(this).addClass("selected").siblings().removeClass("selected");
                    }
                }else{
                    if($(this).hasClass("selected"))
                    {
                        $(this).removeClass("selected");
                    }else{
                        $(this).addClass("selected");
                    }
                    $(this).parent('ul').find(".select-all").removeClass("selected");
                }

                var json = {}; //使用一个数组存储所有数据
                var select6 = zzz("#select6", "shx"); //接受数据
                var select2 = zzz("#select2", "shhj");
                var select3 = zzz("#select3", "hs");
                var select4 = zzz("#select4", "gstx");
                var select5 = zzz("#select5", "jixiang");
                var select7 = zzz("#select7", "qhlx");

                if (select2 != "") {
                    json["shhj"] = select2;
                }
                if (select3 != "") {
                    json["hs"] = select3;
                }
                if (select4 != "") {
                    json["gstx"] = select4;
                }
                if (select5 != "") {
                    json["jixiang"] = select5;
                }
                if (select6 != "") {
                    json["shx"] = select6;
                }
                if (select7 != "") {
                    json["qhlx"] = select7;
                }

                //console.log(json);return false;
               // form(json); //只提交一次
                $.ajax({
                    url: "/index.php?c=search&mid=news&m=index",
                    data: json,
                    type: 'get',
                    dataType: "html",
                    success: function (data) {
                        $("#ajax-body").html(data);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        responseText = $.parseJSON(jqXHR.responseText);
                        var message = responseText.msg;
                        if (!message) {
                            message = "服务器出错了！";
                        }
                        alert(message);
                    }
                });
                return false;
            });
            $("body").on("click",".page li",function(){
                var url = $(this).find("a").attr("ajax-href");
                var json = {}; //使用一个数组存储所有数据
                var select6 = zzz("#select6", "shx"); //接受数据
                var select2 = zzz("#select2", "shhj");
                var select3 = zzz("#select3", "hs");
                var select4 = zzz("#select4", "gstx");
                var select5 = zzz("#select5", "jixiang");
                var select7 = zzz("#select7", "qhlx");

                if (select2 != "") {
                    json["shhj"] = select2;
                }
                if (select3 != "") {
                    json["hs"] = select3;
                }
                if (select4 != "") {
                    json["gstx"] = select4;
                }
                if (select5 != "") {
                    json["jixiang"] = select5;
                }
                if (select6 != "") {
                    json["shx"] = select6;
                }
                if (select7 != "") {
                    json["qhlx"] = select7;
                }

                //console.log(json);return false;
                // form(json); //只提交一次
                $.ajax({
                    url: url,
                    data: json,
                    type: 'get',
                    dataType: "html",
                    success: function (data) {
                        $("#ajax-body").html(data);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        responseText = $.parseJSON(jqXHR.responseText);
                        var message = responseText.msg;
                        if (!message) {
                            message = "服务器出错了！";
                        }
                        alert(message);
                    }
                });
                return false;
            });

            function zzz(select, leixing) { //id值和数据类型值
                var shuju = {};
                var i = 0;
                $(select + " .selected").each(function() { //获取相应栏目下的数据，value
                    if ($(this).children('a').attr('class')) {
                        shuju[i] = $(this).children('a').attr('class');
                        i++;
                    }
                    //console.log($(this).children('a').attr('class'));
                });
                return shuju; //返回数据

            }

        });

        function form(json) {
            // 取得要提交的参数
            // 创建Form
            var form = $('<form></form>');
            // 设置属性
            form.attr('action', '/index.php');
            form.attr('method', 'get');
            // 创建Input
            var my_c = $('<input type="hidden" name="c" value="search"/>');
            var my_mid = $('<input type="hidden" name="mid" value="news"/>');
            var my_m = $('<input type="hidden" name="m" value="index"/>');
            form.append(my_c);
            form.append(my_mid);
            form.append(my_m);
            //for(var i=0;i<value.length;i++){
            for (var tao in json) { //json数组遍历
                var my_input = $('<input type="hidden" />');
                my_input.attr('name', tao);
                my_input.attr('value', json[tao]);
                form.append(my_input);
            }

            //}
            //附加到Form
            //附加到document
            $(document.body).append(form);
            // 提交表单
            form.submit();
        }
    </script>
</head>

<body>
<div class="main1">
    <div class="head">

    </div>
</div>
<div class="main">
    <div class="select" id="select">

        <ul class="list" id="select-result" style="display: none">
            <li>已选条件：</li>
            <?php if (!isset($inputshx)) :?>
            <li id="select-no">无</li>
            <?php else : echo $inputshx;  endif;?>
        </ul>

        <ul class="list fl" id="select6" style="width: 800px;">
            <li>生活型：</li>
            <li class="select-all <?php if (!isset($_GET[ 'shx'])):?> selected <?php endif;?>" >
                <a href="javascript:;"  >全部</a>
            </li>
            <?php $field = dr_field_options('shx','1','news');  if (is_array($field)) { $count=count($field);foreach ($field as $value=>$name) { ?>
            <li><a href="javascript:;" id="shx" class="<?php echo $value; ?>"><?php echo $name; ?></a></li>
            <?php } } ?>
        </ul>

        <ul class="list fl" id="select2">
            <li>生活环境：</li>
            <li class="select-all <?php if (!isset($_GET[ 'shhj'])):?>selected <?php endif;?>"><a href="javascript:;"  >全部</a></li>
            <?php $field = dr_field_options('shhj','1','news');  if (is_array($field)) { $count=count($field);foreach ($field as $value=>$name) { ?>
            <li><a href="javascript:;" id="shhj" class="<?php echo $value; ?>"><?php echo $name; ?></a></li>
            <?php } } ?>
        </ul>

        <ul class="list fl" id="select4">
            <li>观赏特性：</li>
            <li class="select-all <?php if (!isset($_GET[ 'gstx'])):?>selected <?php endif;?>"><a href="javascript:;"  >全部</a></li>
            <?php $field = dr_field_options('gstx','1','news');  if (is_array($field)) { $count=count($field);foreach ($field as $value=>$name) { ?>
            <li><a href="javascript:;" id="gstx" class="<?php echo $value; ?>"><?php echo $name; ?></a></li>
            <?php } } ?>
        </ul>

        <ul class="list fl" id="select3">
            <li>花色：</li>
            <li class="select-all <?php if (!isset($_GET[ 'hs'])):?> selected<?php endif;?>"><a href="javascript:;"  >全部</a></li>
            <?php $field = dr_field_options('hs','1','news');  if (is_array($field)) { $count=count($field);foreach ($field as $value=>$name) { ?>
            <li style="width: 50px;"><a href="javascript:;" id="hs" class="<?php echo $value; ?>"><?php echo $name; ?></a></li>
            <?php } } ?>
        </ul>

        <ul class="list fl" id="select5">
            <li>季相：</li>
            <li class="select-all <?php if (!isset($_GET[ 'jixiang'])):?>selected <?php endif;?>"><a href="javascript:;"  >全部</a></li>
            <?php $field = dr_field_options('jixiang','1','news');  if (is_array($field)) { $count=count($field);foreach ($field as $value=>$name) { ?>
            <li><a href="javascript:;" id="jixiang" class="<?php echo $value; ?>"><?php echo $name; ?></a></li>
            <?php } } ?>
        </ul>

        <ul class="list fl" id="select7">
            <li>气候类型：</li>
            <li class="select-all  <?php if (!isset($_GET[ 'qhlx'])):?>selected <?php endif;?>"><a href="javascript:;" >全部</a></li>
            <?php $field = dr_field_options('qhlx','1','news');  if (is_array($field)) { $count=count($field);foreach ($field as $value=>$name) { ?>
            <li><a href="javascript:;" id="qhlx" class="<?php echo $value; ?>"><?php echo $name; ?></a></li>
            <?php } } ?>
        </ul>
        <!--</form>-->
    </div>