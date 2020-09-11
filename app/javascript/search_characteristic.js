
$(document).on('turbolinks:load', function() {
  $('#search-results').on("click","p",function(){
    $(this).css('color','red');
    var selected_html = $(this).html();
    var selected_id = $(this).attr("id");
    var select_list = $('#select-characteristic').html();
    if (select_list.indexOf(selected_html) > -1){
      console.log("選択済みです");
    }
    else{
      $('#select-characteristic').html(`${select_list} <p class="selected" id="${selected_id}">${selected_html}</p>`);
    }
  });
  $('#question-form').on("click","input",function(){
    $('#search-results').html('<p> </p>')
  });
 

  $(document).on('keyup', 'input', function() {
    var keyword = $('#q_title_cont').val();
    $.ajax({
      url: '/questions/search',
      type: 'GET',
      data: {
        q: {title_cont:keyword}
      },
    })
    .done(function(response){
      if (response !== undefined){
        $('#search-results').html('');
      response.results.forEach((value,index,array)=>{
        var search_results = $('#search-results').html();
        $('#search-results').html(`${search_results} <p id="${value.id}">${value.title}</p>`);
      });
      
      }
    })
    
    .fail(function(xhr){
    });
  
    });

    $('#submit').on("mouseover","input", function(){
      var selected_ids = []
      $('.selected').each((value, index) => {
        selected_ids.push(index.id);
      });
      $('#hidden-parameter').html(`<input type="hidden" name="selected_ids" value=${selected_ids}>`);
    });

  });
