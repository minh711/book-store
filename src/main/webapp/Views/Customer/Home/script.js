//$('input[type="checkbox"]').click(function () {
//    multiselectSearch();
//});
//
//genreIds = [];
//
//
//function multiselectSearch(){
////    console.log("hello");
//    $.ajax({
//        url: "/BookSearch",
//        type: "post",
//        data: {multiselect: true, genreIds},
//        traditional: true,
//        success: function (data) {
//            $('#bookselect').empty();
//            $('#bookselect').append(data);
//        },
//        error: function (xhr) {
//        }
//    });
//}