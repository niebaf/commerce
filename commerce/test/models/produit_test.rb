require 'test_helper'

class ProduitTest < ActiveSupport::TestCase

 test "ne doit pas accepter un produit vide" do
    produit = Produit.new
    assert !produit.save
  end
  
  test "ne doit pas accepter un nom vide" do
    produit = Produit.new
	produit.prix = 9.99
    assert !produit.save
  end
  
   test "ne doit pas accepter un prix vide" do
    produit = Produit.new
	produit.nom = 'blahhhh'
    assert !produit.save
  end
  
  
   test "ne doit pas accepter un prix non numerique" do
    produit = Produit.new
	produit.prix = 'monprix'
    assert !produit.save
  end
  
  test "ne doit pas accepter une image pdf" do
    produit = Produit.new
	produit.image = 'http://dsf.sfd/image.pdf'
    assert !produit.save
  end
  
  
  test "ne doit pas accepter une image qui ne sit une url http" do
    produit = Produit.new
	produit.image = 'dsf.sfd/image.pdf'
    assert !produit.save
  end
  
  test "accepter les images gif, png ou jpg"do
  ['gif','png','jpg'].each{|type|
  produit = Produit.new
  produit.nom="p#{type}"
  produit.prix=0.5
  produit.image="http://dfgd.dfg/image.#{type}"
  assert produit.save
  }
  end
  
  
end
