class UserMailer < ApplicationMailer
    default from: 'no-reply@kittenshop.fr'

    def order_email(order)
      #on récupère l'instance user pour ensuite pouvoir la passer à la view en @order
      @order = order

      #on définit une variable @url qu'on utilisera dans la view d’e-mail
      @url  = 'http://kittenshop.fr/login'

      # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
      mail(to: @user.email,
        subject: "Confirmation de votre commande Kitten Shop",
      )
    end

    def welcome_email(user)
      @user = user
      mail(
        from: "kittenshopthp@gmail.com",
        to: @user.email,
        #to: email_address_with_name(@user.email, @user.name),
        subject: 'Welcome to the Kitten Store',
        delivery_method_options: { version: 'v3.1' }
      )
    end

  end