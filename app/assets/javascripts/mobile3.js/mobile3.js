function jsonLoad(jsonurl, handler){
 var params = { dataType: 'json', async: false, cache: true, ifModified: true, url: jsonurl, success: handler } ;
 $.ajax(params).error(function(jqxhr,s,m){ alert('Erreur json'); });
}

function json_success_produits(data, textStatus, jqxhr) {
  alert(data);
  $.each(data,function(i,produit){
   var strli = '<li><a href="#produit">'+produit["nom"]+'</a></li>'
   $('#listeProduits').append(strli);
  });
  $('#listeProduits').listview('refresh');
}
////////////////////////////////////
////////////////////////////////////
$(document).on('pageinit','#accueil',function(event){
 jsonLoad("/produits.json",json_success_produits);
}); // pageinit accueil