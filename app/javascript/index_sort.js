
// $(document).on('turbolinks:load', function() {
//   $('#pulldown').on('change', 'select', function() {
//     var select_option = 
//     $.ajax({
//       url: 'posts/index',
//       type: 'GET',
//       data: {
//         q: {title_cont:keyword}
//       },
//     })
//     .done(function(response){
//       if (response !== undefined){
//         $('#search-results').html('');
//       response.results.forEach((value,index,array)=>{
//         var search_results = $('#search-results').html();
//         $('#search-results').html(`${search_results} <p id="${value.id}">${value.title}</p>`);
//       });

//       }
//     })

//     .fail(function(xhr){
//     });

//     });

// });