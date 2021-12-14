*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Keywords ***
Login
     [arguments]    ${my_email}     ${my_pw}
     Open Browser   url=https://app.deriv.com    browser=chrome
     set window size    1280    1028
     wait until page does not contain element   dt_core_header_acc-info-preloader    60
     wait until page contains element   ${login_button}      60
     click element  ${login_button}
     wait until page contains element   ${email_field}     15
     input text     ${email_field}      ${my_email}
     input text     ${pw_field}      ${my_pw}
     click element  ${login_oauth_btn}
#    click element  //*[text()="Real" and contains(@class,"active")]
#    Close Browser

TaskOne
    wait until page contains element  dt_core_account-info_acc-info  60
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    click element  dt_core_account-info_acc-info
    click element  real_account_tab
    click element  dt_core_account-switcher_demo-tab
    click element  dt_VRTC4795334
    wait until page does not contain element  dt_core_header_acc-info-preloader  60
    wait until page does not contain element  sidebar__items  60

TaskTwo
    click element   dt_contract_dropdown
    click element   dc_all_link
    click element   dt_contract_rise_fall_item
    reload page
    wait until page contains element  //*[contains(@class, "chart-container__loader")]    30
    wait until element is visible   //*[contains(@class, "cq-symbol-select-btn")]   15
    click element   //*[contains(@class, "cq-symbol-select-btn")]
    wait until element is visible   //*[contains(@class, "sc-mcd__filter__item sc-mcd__filter__item--selected")]
    click element   //*[contains(@class, "sc-mcd__filter__item sc-mcd__filter__item--selected")]
    wait until element is visible  //*[contains(@class, "sc-mcd__item__name")]
    click element   //*[contains(@class, "sc-mcd__item__name")]
    wait until page does not contain element  //*[contains(@class, "chart-container__loader")]    30
    wait until element is visible   dt_purchase_call_button     15
    click element      dt_purchase_call_button

TaskThree
    wait until element is visible   //*[contains(@class, "cq-symbol-select-btn")]   15
    click element   //*[contains(@class, "cq-symbol-select-btn")]
#   wait until element is visible   //*[text()="Forex" and contains(@class, "sc-mcd__filter__item sc-mcd__filter__item--selected")]     15
#   click element   //*[text()="Forex" and contains(@class, "sc-mcd__filter__item sc-mcd__filter__item--selected")]
    scroll element into view   //*[contains(@class, "sc-mcd__category__content sc-mcd__category__content--major-pairs sc-mcd__category__content--has-subcategory")]
    click element   //*[contains(@class, "sc-mcd__item sc-mcd__item--frxAUDUSD")]
    wait until page does not contain element  //*[contains(@class, "chart-container__loader")]    30
    click element   dt_contract_dropdown
    click element   dc_all_link
    click element   dt_contract_high_low_item
    reload page
    wait until page does not contain element  dt_core_header_acc-info-preloader  60
#    wait until page contains element  sidebar__items
    click element   //*[contains(@class, "dc-input__field")]
    ${current_value}=   get element attribute   //*[contains(@class, "dc-input__field")]    value
    ${value_length}=    get length      ${current_value}
    repeat keyword      ${value_length}     press keys      //*[contains(@class, "dc-input__field")]    BACKSPACE
    input text      //*[contains(@class, "dc-input__field")]    text=2
#    click element   //*[contains(@class, "dc-calendar__cell dc-calendar__cell--active dc-calendar__cell--active-duration")]
    click element   dc_payout_toggle_item
    wait until element is visible       //*[contains(@class, "purchase-container")]  30
    click element   dt_amount_input
    ${current_value}=   get element attribute   dt_amount_input   value
    ${value_length}=    get length      ${current_value}
    repeat keyword      ${value_length}     press keys      dt_amount_input    BACKSPACE
    input text      dt_amount_input    text=15.50
    wait until element is visible       //*[contains(@class, "purchase-container")]  30
    wait until element is visible      dt_purchase_put_button   15
    click element   dt_purchase_put_button




