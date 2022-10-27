document.addEventListener("DOMContentLoaded",function(){
  const ItemImageList = document.getElementById("item_image-list");
  if (!ItemImageList){ return false;}
  document.getElementById("item-image").addEventListener("change", function(e){
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
  ItemImageList.appendChild(imageElement);
  });
});