document.addEventListener("DOMContentLoaded",function(){
  const PictureList = document.getElementById("picture-list");
  if (!PictureList){ return false;}
  document.getElementById("post_image").addEventListener("change", function(e){
   const imageContent = document.querySelector('img');
   if (imageContent){
     imageContent.remove();
   }

   const file = e.target.files[0];
   const blob = window.URL.createObjectURL(file);

   const imageElement =  document.createElement('div');
   const blobImage = document.createElement('img');
   blobImage.setAttribute('src', blob);
   blobImage.classList.add('preview-size');
  imageElement.appendChild(blobImage);
  PictureList.appendChild(imageElement);
  });
});