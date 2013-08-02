class StateEventInput < SimpleForm::Inputs::FileInput
  def collection
    object.send(transitions_method_name)
  end

  def input
    label_method = :human_to_name
    value_method = :event
    input_options = { include_blank: object.send(human_state_name_method) }

    out = @builder.collection_select(
      attribute_name, collection, value_method, label_method,
      input_options, input_html_options
    )
    out.html_safe
  end

  private
  def machine_name
    machine_name = attribute_name.to_s.gsub "_event", ""
  end

  def transitions_method_name
    "#{machine_name}_transitions"
  end

  def human_state_name_method
    "human_#{machine_name}_name"
  end
end