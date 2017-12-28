
function toggleDone() {
  $(this).parent().parent().toggleClass("danger");
}

function createSong(name, artist_id) {

  var label = $('<h3></h3>')
    .html(name);

  var checkbox = $('<input type="checkbox" value="1" />')
    .attr('id', checkboxId)
    .bind('change', toggleDone);

  var checkboxId = "song-";

  var label = $('<label></label>')
    .attr('for', checkboxId)
    .html(name);

  var checkbox = $('<input type="checkbox" value="1" />')
    .attr('id', checkboxId)
    .bind('change', toggleDone);

  var tableRow = $('<tr class="song"></td>')
    .append($('<td>').append(checkbox))
    .append($('<td>').append(label));

  $("#songList").append( tableRow );

  var newSong = { name: name };

  $.ajax({
    type: "POST",
    url: "/artists/" + artist_id + "/songs",
    data: JSON.stringify({
        song: newSong
    }),
    contentType: "application/json",
    dataType: "json"
  })
  .fail(function(error) {
      console.log(error);

      error_message = error.responseJSON.name[0];
      showError(error_message);
    });
}

function showError(message) {
  var errorHelpBlock = $('<span class="help-block"></span>')
    .attr('id', 'error_message')
    .text(message);

  $("#formgroup-name")
    .addClass("has-error")
    .append(errorHelpBlock);
}

function submitSong(event) {
  event.preventDefault();
  createSong($("#song_name").val(),$("#song_artist_id").val());
  $("#song_name").val(null);

}

function cleanUpDoneSongs(event) {
  event.preventDefault();
  $.when($(".danger").remove())
    .then(updateCounters);
}

$(document).ready(function() {
  $("input[type=checkbox]").bind('change', toggleDone);
  $("form").bind('submit', submitSong);
  $("#clean-up").bind('click', cleanUpDoneSongs);
});
