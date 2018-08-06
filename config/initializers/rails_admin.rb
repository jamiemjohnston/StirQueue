RailsAdmin.config do |config|

  config.main_app_name = ["Simple Queue", "Admin Panel"]

  config.navigation_static_links = {
  'Home' => 'http://localhost:3000'
}

  config.authorize_with do
    redirect_to home unless current_user.admin == true
  end

  ### Popular gems integration

  # # == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)


  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end



end
