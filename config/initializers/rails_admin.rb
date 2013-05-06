# RailsAdmin config file. Generated on April 10, 2013 14:40
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|

  config.main_app_name = ['BizonApps', 'Admin']

  config.current_user_method { current_admin } # auto-generated

  config.excluded_models = ['PortfolioUser']

  config.model Portfolio do
    configure :image, :jcrop
    edit do
      field :name, :string
      field :description, :text
      field :url, :string
      field :image do
        jcrop_options aspectRatio: 360.0/260.0
      end
      field :users do
        label 'Developers'
      end
    end
    show do
      field :name, :string
      field :description, :text
      field :url, :string
      field :image do
        jcrop_options aspectRatio: 360.0/260.0
      end
      field :users do
        label 'Developers'
      end
    end
    list do
      field :name, :string
      field :users do
        label 'Developers'
      end
    end
  end

  config.model User do
    object_label_method do
      :custom_label_method
    end
    show do
      field :firstname
      field :lastname
      field :email
      field :sign_in_count
      field :last_sign_in_at
      field :last_sign_in_ip
    end
    list do
      field :firstname
      field :lastname
      field :email
      field :sign_in_count
      field :last_sign_in_at
      field :last_sign_in_ip
    end
  end
end
