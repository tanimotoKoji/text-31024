window.addEventListener("turbolinks:load", function(){
  const postBtn = document.querySelector('.posts-btn');
  const postAlert = function(){
    swal('投稿が完了しました')
  };
  postBtn.addEventListener('click',postAlert);
});