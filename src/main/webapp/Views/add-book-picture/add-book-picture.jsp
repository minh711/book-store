<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>Add Book Picture Component</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${pageContext.request.contextPath}/Assets/bootstrap-5.3.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/Assets/bootstrap-5.3.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/Assets/fontawesome-free-6.4.2-web/css/all.min.css">
</head>

<body>
    <header class="d-flex justify-content-between" style="padding: 10px;">
        <div class="d-flex align-items-center justify-content-between">
            <img src="${pageContext.request.contextPath}/Images/logo.jpg" style="height: 40px;">
        </div>
    </header>

    <main class="bg-light d-flex">
        <aside>
            <div class="flex-shrink-0 p-3" style="width: 280px;">
                <a href="#" class="text-dark d-flex align-items-center pb-3 mb-3 link-body-emphasis text-decoration-none border-bottom">
                    Sample
                </a>
                <ul class="list-unstyled ps-0">
                    <li class="mb-1">
                        <a href="#" class="text-light nav-link bg-primary rounded p-2">
                            Sample
                        </a>
                    </li>
                </ul>
            </div>
        </aside>
        
        <div class="container">
            <form class="form" id="form-pics" method="post" 
                  action="${pageContext.request.contextPath}/BookPictureCtrl" 
                  onsubmit="return formValidate();" 
                  enctype="multipart/form-data">
                <input type="file" class="form-control" id="pics" name="fPics" multiple>
            </form>
        </div>
    </main>
    
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-6 p-4">
                    <img src="${pageContext.request.contextPath}/Images/logo.jpg" alt="" style="height: 40px;">
                    <div>
                        <i class="fa fa-map-marker mx-2"></i>Địa chỉ: 600 Nguyễn Văn Cừ nối dài, An Bình, Ninh Kiều, Cần Thơ 
                    </div>
                </div>
                <div class="col-md-4 p-4">
                    <div class="d-flex">
                        <i class="fa fa-envelope d-flex justify-content-center align-items-center mx-2"></i>
                        <div>
                            business@oceanbook.com
                        </div>
                    </div>
                </div>
                <div class="col-md-2 d-flex justify-content-between p-4">
                    <i class="fa-brands fa-facebook"></i>
                    <i class="fa-brands fa-facebook-messenger"></i>
                    <i class="fa-brands fa-youtube"></i>
                </div>
            </div>
        </div>
    </footer>
    
    <script src="${pageContext.request.contextPath}/Assets/jquery-3.7.1/jquery-3.7.1.min.js"></script>                
    <script>
        $(document).ready(function () {
            $('#pics').val(''); // clear the input
            
            $('#pics').change(function () {
                if (formValidate()) {
                $('#form-pics').submit();
                } else {
                    $('#pics').val('');
                }
            });
        });
        
        function formValidate() {
            let pics = $("#pics")[0].files;
    
            if (pics.length === 0) {
                alert("Vui lòng chọn một hoặc nhiều ảnh!");
                return false;
            }
            
            for (let i = 0; i < pics.length; i++) {
                let fileName = pics[i].name;
                if (!hasExtension(fileName, ['.jpg', '.jpeg', '.png'])) {
                    alert("Vui lòng chọn file hình ảnh!");
                    return false;
                }
            }
            
            return true;
        }
        
        function hasExtension(fileName, exts) {
            return (new RegExp('(' + exts.join('|').replace(/\./g, '\\.') + ')$')).test(fileName);
        }
    </script>
</body>

</html