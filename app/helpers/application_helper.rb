module ApplicationHelper
  def create_index params_page, index, per_page
    params_page = 1 if params_page.nil?
    (params_page.to_i - 1) * per_page.to_i + index.to_i + 1
  end

  def errors_for form, field
    content_tag(:p, form.object.errors[field].try(:first), class: "help-block")
  end

  def form_group_for form, field, opts={}, &block
    label = opts.fetch(:label) {true}
    has_errors = form.object.errors[field].present?

    content_tag :div, class: "form-group #{"has-error" if has_errors}" do
      concat form.label(field, class: "control-label") if label
      concat capture &block
      concat errors_for form, field
    end
  end

  def list_group_products
    @group_products = GroupProduct.all.select(:id, :name)
      .map{|group_product| [group_product.name, group_product.id]}
  end
end
