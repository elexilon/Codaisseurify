
function toggleDone() {
  $(this).parent().parent().toggleClass("danger");

}

function createSong(name, artist_id) {
  var newSong = { name: name };

  $.ajax({
    type: "POST",
    url: "/artists/" + artist_id + "/songs",
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    data: JSON.stringify({
        song: newSong
    }),
    contentType: "application/json",
    dataType: "json"
  })
  .done(function(data) {
    var label = $('<h3></h3>')
      .html(name);

    var checkbox = $('<input type="checkbox" value="1" />')
      .attr('id', checkboxId)
      .bind('change', toggleDone);

    var checkboxId = data.id;

    var label = $('<label></label>')
      .attr('for', checkboxId)
      .html(name);

    var checkbox = $('<input type="checkbox" value="1" />')
      .attr('id', checkboxId)
      .bind('change', toggleDone);

    var tableRow = $('<tr class="song"></td>')
      .append($('<td width="5%">').append(checkbox))
      .append($('<td>').append(label));

    $("#songList").append( tableRow );

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

function deleteSelectedSongs(event) {
  event.preventDefault();
  $.each($(".danger"), function(index, tableRow) {
      songId = $(tableRow).data('id');
      deleteSong(songId);
    });
  }

function deleteAllSongs(event) {
  event.preventDefault();
  $.each($(".song"), function(index, tableRow) {
      songId = $(tableRow).data('id');
      deleteSong(songId);
    });
  }

function deleteSong(songId) {
  var artist_id = $("#song_artist_id").val();
  $.ajax({
    type: "DELETE",
    url: "/artists/" + artist_id + "/songs/" + songId + ".json",
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    contentType: "application/json",
    dataType: "json"
  })
  .done(function(data) {
    $('tr[data-id="'+songId+'"]').remove();
  });
}

$(document).ready(function() {
  $("input[type=checkbox]").bind('change', toggleDone);
  $("form").bind('submit', submitSong);
  $("#delete-selected").bind('click', deleteSelectedSongs);
  $("#delete-all").bind('click', deleteAllSongs);
});
