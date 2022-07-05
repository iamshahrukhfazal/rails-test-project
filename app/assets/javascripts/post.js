function debounce(){
    $.ajax({
        type: "POST",
        url: "/posts/searchpost",
        data: { post: { title:  $("#searchInput").val()} },
      })
}