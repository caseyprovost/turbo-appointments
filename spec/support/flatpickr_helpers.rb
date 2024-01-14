# frozen_string_literal: true

module FlatpickrHelpers
  OPEN_DATE_PICKER_XPATH = "//div[contains(@class, 'flatpickr-calendar') and contains(@class, 'open')]"
  OPEN_TIME_PICKER_XPATH = "#{OPEN_DATE_PICKER_XPATH}/div[contains(@class, 'flatpickr-time')]".freeze

  # Last argument is the date number. Example usage:
  #   select_date "input[placeholder='Date']", "8"
  def select_date(selector_or_element, day:, month:, year: Time.current.year)
    open_date_picker(selector_or_element) do

      find(".numInputWrapper").click
      12.times do
        find(:xpath, ".//span[contains(@class, 'flatpickr-next-month')]").click
        selected_month = find('[aria-label="Month"]').value
        break if selected_month == (month - 1).to_s
      end

      years_forward = year - Time.current.year

      unless years_forward.zero?
        find(".numInputWrapper").click
        years_forward.times do
          find(:xpath, ".//span[contains(@class, 'arrowUp')]").click
        end
      end

      find(:xpath,
           ".//span[contains(@class, 'flatpickr-day')
           and not(contains(@class, 'nextMonthDay'))
           and not(contains(@class, 'prevMonthDay'))
           and .='#{day}']").click
    end
  end

  def select_native_date(date, from:)
    label_el = find("label", text: from)
    id = label_el["for"].gsub("_1i", "")
    select(date.year, from: "#{id}_1i")
    select(date.strftime("%B"), from: "#{id}_2i")
    select(date.day, from: "#{id}_3i")
  end

  def open_date_picker(selector_or_element, &block)
    if selector_or_element.is_a?(Capybara::Node::Element)
      selector_or_element.click
    else
      find(selector_or_element).click
    end

    date_picker = find(:xpath, OPEN_DATE_PICKER_XPATH)
    within(date_picker, &block) if block_given?
  end

end
