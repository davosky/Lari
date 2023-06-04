RailsAdmin.config do |config|
  config.asset_source = :sprockets

  config.authorize_with do
    redirect_to main_app.root_path unless current_operator.admin == true
  end

  config.parent_controller = "ApplicationController"

  config.main_app_name = ["Lari"]

  config.model "Operator" do
    visible true
    label "Operatore"
    label_plural "Operatori"
  end

  config.model "Sex" do
    visible true
    label "Sesso"
    label_plural "Sessi"
  end

  config.model "Occupation" do
    visible true
    label "Occupazione"
    label_plural "Occupazioni"
  end

  config.model "SubscriptionReason" do
    visible true
    label "Motivo Sottoscrizione"
    label_plural "Motivi Sottoscrizione"
  end

  config.model "PrivateSector" do
    visible true
    label "Settore Privato"
    label_plural "Settori Privati"
  end

  config.model "PublicSector" do
    visible true
    label "Settore Publico"
    label_plural "Settori Publici"
  end

  config.model "Category" do
    visible true
    label "Categoria"
    label_plural "Categorie"
  end

  config.model "DeliveryCard" do
    visible true
    label "Tessera Consegnata"
    label_plural "Tessera Consegnata"
  end

  config.model "SubscriptionType" do
    visible true
    label "Tipo Sottoscrizione"
    label_plural "Tipi Sottoscrizione"
  end

  config.model "Subscriber" do
    visible true
    label "Sottoscrittore"
    label_plural "Sottoscrittori"
  end

  config.model "PrivacyFirst" do
    visible true
    label "Primo Consenso Privacy"
    label_plural "Primo Consenso Privacy"
  end

  config.model "PrivacySecond" do
    visible true
    label "Secondo Consenso Privacy"
    label_plural "Secondo Consenso Privacy"
  end

  config.model "PrivacyThird" do
    visible true
    label "Terzo Consenso Privacy"
    label_plural "Terzo Consenso Privacy"
  end

  config.actions do
    dashboard
    index
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
