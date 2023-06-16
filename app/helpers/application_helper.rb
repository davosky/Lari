module ApplicationHelper
  def admin?
    current_operator.admin == true
  end

  def full_operator
    "#{current_operator.first_name} #{current_operator.last_name} - #{current_operator.office}"
  end

  def has_subscribed(subscriber)
    unless subscriber.category_id == 1
      "text-success"
    else
      "text-danger"
    end
  end

  def gender_icon(subscriber)
    gendericon = ""
    if subscriber.sex_id == 1
      gendericon = "<i class='fa-solid fa-venus text-female'></i>"
    elsif subscriber.sex_id == 2
      gendericon = "<i class='fa-solid fa-mars text-male'></i>"
    else
      gendericon = "<i class='fa-solid fa-venus-mars text-transgender'></i>"
    end
    gendericon.html_safe
  end

  def landlord_type_icon(landlord)
    landlordtypeicon = ""
    if landlord.landlord_type_id == 1
      landlordtypeicon = "<i class='fa-solid fa-industry text-primary'></i>&nbsp;(Agenzia) "
    else
      landlordtypeicon = "<i class='fa-solid fa-user-tie text-primary'></i>&nbsp;(Privato)"
    end
    landlordtypeicon.html_safe
  end

  def privacy_icon(subscriber)
    privacyicon = ""
    if subscriber.privacy_first.name == "SI" && subscriber.privacy_second.name == "SI" && subscriber.privacy_third.name == "SI"
      privacyicon = "<i class='fa-solid fa-key text-success'></i> <i class='fa-solid fa-key text-success'></i> <i class='fa-solid fa-key text-success'></i>"
    elsif subscriber.privacy_first.name == "SI" && subscriber.privacy_second.name == "SI" && subscriber.privacy_third.name == "NO"
      privacyicon = "<i class='fa-solid fa-key text-success'></i> <i class='fa-solid fa-key text-success'></i> <i class='fa-solid fa-key text-danger'></i>"
    elsif subscriber.privacy_first.name == "SI" && subscriber.privacy_second.name == "NO" && subscriber.privacy_third.name == "NO"
      privacyicon = "<i class='fa-solid fa-key text-success'></i> <i class='fa-solid fa-key text-danger'></i> <i class='fa-solid fa-key text-danger'></i>"
    elsif subscriber.privacy_first.name == "NO" && subscriber.privacy_second.name == "NO" && subscriber.privacy_third.name == "NO"
      privacyicon = "<i class='fa-solid fa-key text-danger'></i> <i class='fa-solid fa-key text-danger'></i> <i class='fa-solid fa-key text-danger'></i>"
    else
      privacyicon = ""
    end
    privacyicon.html_safe
  end
end
