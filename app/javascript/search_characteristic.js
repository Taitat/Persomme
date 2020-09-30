
$(document).on('turbolinks:load', function() {
  $('#search-results').on("click","span",function(){
    
    var selected_html = $(this).html();
    var selected_id = $(this).attr("id");
    var select_list = $('#select-characteristic').html();
    if (select_list.indexOf(selected_html) > -1){
      console.log("選択済みです");
    }
    else{
    
      $('#select-characteristic').html(`${select_list} <span class="selected" id="${selected_id}">${selected_html}</span>`);
      $('#select-characteristic').css('display','block');
    }
  });

  $('#select-characteristic').on("click","span", function(){
    $(this).remove();
  })

  $(document).click(function(event) {
    if(!$(event.target).closest('#search-results','#select-characteristic').length) {
      $('#search-results').css('display','none');
    } else {
      console.log('内側がクリックされました。');
    }
  });

  $('#search-results').on("mouseover","span",function(){
    $(this).css('background-color','#ede2fa');
    $(this).css('border','1px solid lightgray')
  })
  $('#search-results').on("mouseout","span",function(){
    $(this).css('background-color','#EAD9FF');
    $(this).css('border','1px solid #EAD9FF')
  })
 

  $('.persona-select').on('keyup', 'input', function() {
    var keyword = $('#p_title_cont').val();
    $.ajax({
      url: '/questions/search',
      type: 'GET',
      data: {
        p: {title_cont:keyword}
      },
    })
    .done(function(response){
      if (response !== undefined){
        $('#search-results').html('');
      response.results.forEach((value,index,array)=>{
        var search_results = $('#search-results').html();
        $('#search-results').html(`${search_results} <span id="${value.id}">${value.title}</span>`);
        $('#search-results').css('display','block');
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
