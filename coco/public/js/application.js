$(document).ready(function () {
  // send an HTTP DELETE request for the sign-out link
  $('a#sign-out').on("click", function (e) {
    e.preventDefault();
    var request = $.ajax({ url: $(this).attr('href'), type: 'delete' });
    request.done(function () { window.location = "/"; });
  });

  var generate_options = function(options) {
    options_array = [];
    for(i = 0; i < options.length; i++) {
      options_array.push('<input type="radio" name="options" value="' + options[i] + '"> ' + options[i] + '<br>');
    };
    return options_array
  };

  $('#new_question').on('submit', function(event) {
    event.preventDefault();

    var new_question = ( $( this ).serialize() );

    $.ajax({
      url: '/new_question',
      type: 'post',
      data: new_question,
      dataType: 'json'
    }).done( function(response) {
      var content = response.content
      var options = response.options
      var generated_options = generate_options(options);
      console.log(response.visitor_cookie);

      $('#new_questions').append('<div class="question"><h4>' + content + '</h4><form action="/new_answer" method="post">' + generated_options.join("") + '<input type="hidden" name="question_id" value="' + response.question_id + '"><input type="hidden" name="visitor_cookie" value="' + response.visitor_cookie + '"><input type="submit" value="Answer"></form></div>');

      $('input[type="text"]').val('');

    }).fail( function(response) { console.log('you failllllled: ' + response) });
  });

});

