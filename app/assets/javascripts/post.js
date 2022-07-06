function debounce(){
    $.ajax({
        type: "POST",
        url: "/reports/search_post",
        data: { post: { title:  $("#searchInput").val()} },
      })
}