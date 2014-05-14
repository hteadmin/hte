$(document).on 'ready page:load', ->
  $(".set").click ->
    $(this).find("input[type='radio']").prop "checked", true
    $(".set").removeClass "active"
    $(this).addClass "active"
    selectedSet = $(this).find("input[type='radio']").val()
    $(".gameset").hide()
    $("#instance_" + selectedSet).show()

  $('#ps-tabs a[data-toggle="tab"]').on 'shown.bs.tab', (e) ->
    current_tab = $(e.target)
    previous_tab = $(e.relatedTarget)

    $(previous_tab.attr('href') + " .set input[type='radio']").prop 'checked', false
    $(previous_tab.attr('href') + " .set").removeClass 'active'

    $(current_tab.attr('href') + " .set:first").trigger 'click'


  if $('#slider_container').length > 0
    options =
      $AutoPlay: true
      # $AutoPlayInterval: 2000
      $DragOrientation: 3 #[Optional] Orientation to drag slide, 0 no drag, 1 horizental, 2 vertical, 3 either, default value is 1 (Note that the $DragOrientation should be the same as $PlayOrientation when $DisplayPieces is greater than 1, or parking position is not 0)
      $ArrowNavigatorOptions: #[Optional] Options to specify and enable arrow navigator or not
        $Class: $JssorArrowNavigator$ #[Requried] Class to create arrow navigator instance
        $ChanceToShow: 2 #[Required] 0 Never, 1 Mouse Over, 2 Always
        $AutoCenter: 0 #[Optional] Auto center arrows in parent container, 0 No, 1 Horizontal, 2 Vertical, 3 Both, default value is 0
        $Steps: 1 #[Optional] Steps to go for each navigation request, default value is 1
    new $JssorSlider$("slider_container", options)


accounting.settings =
  currency:
    symbol: "$" # default currency symbol is '$'
    format: "%s%v" # controls output: %s = symbol, %v = value/number (can be object: see below)
    decimal: "," # decimal point separator
    thousand: "." # thousands separator
    precision: 2 # decimal places
  number:
    precision: 0 # default precision on numbers is 0
    thousand: "."
    decimal: ","

calculateOrder = ->
  rental_weeks = parseInt($('#rental_weeks').val())
  subtotal = 0
  $('.item').each (index, el) ->
    price = $(el).find('.price').data('price')
    cost = $(el).find('.price').data('cost')
    qty = parseInt($(el).find('.qty').val())
    line_total = price * qty * rental_weeks
    subtotal += line_total
    $(el).closest('.item').find('.total span').text(accounting.formatNumber(line_total))

  shipping = 0
  if SHIPPING_PRICES?
    if $('#district').val() != ""
      shipping = SHIPPING_PRICES[$('#district').val()]

  if subtotal >= 500000
    shipping = 0

  if $(".delivery_method").length > 0
    if $(".delivery_method:checked").val() == 'at_store'
      shipping = 0

  total = subtotal + shipping
  $('#subtotal .price span').text(accounting.formatNumber(subtotal))
  $('#shipping .price span').text(accounting.formatNumber(shipping))
  $('#total .price span').text(accounting.formatNumber(total))

@initOrder = ->
  calculateOrder()

  $('#rental_weeks').change ->
    calculateOrder()

  $('#district').change ->
    calculateOrder()

  $('.qty').change ->
    calculateOrder()

  $('.delivery_method').change ->
    calculateOrder()

  $('.deposit').change ->
    calculateOrder()

  initParsleyForm()

@initParsleyForm = ->
  $('.parsley-form').parsley
    inputs: "input, textarea, select" # Default supported inputs.
    excluded: "input[type=hidden], :disabled" # Do not validate input[type=hidden] & :disabled.
    animate: false # fade in / fade out error messages
    animateDuration: 300 # fadein/fadout ms time
    focus: "first" # 'fist'|'last'|'none' which error field would have focus first on form validation
    successClass: "has-success" # Class name on each valid input
    errorClass: "has-error" # Class name on each invalid input
    errorMessage: false # Customize an unique error message showed if one constraint fails
    showErrors: true # Set to false if you don't want Parsley to display error messages
    useHtml5Constraints: false
    errors:
      classHandler: (elem, isRadioOrCheckbox) ->

        # specify where parsley error-success classes are set
        $(elem).parents ".form-group"

      container: (elem, isRadioOrCheckbox) ->
        $(elem).parents ".form-group"

      errorsWrapper: "<span class=\"help-block\"></span>" # do not set an id for this elem, it would have an auto-generated id
      errorElem: "<span></span>" # each field constraint fail in an li

    listeners:
      onFieldValidate: (elem, ParsleyForm) -> # Executed on validation. Return true to ignore field validation
        false

      onFormSubmit: (isFormValid, event, ParsleyForm) -> # Executed once on form validation

      onFieldError: (elem, constraints, ParsleyField) -> # Executed when a field is detected as invalid

      onFieldSuccess: (elem, constraints, ParsleyField) -> # Executed when a field passes validation

document.addEventListener 'page:change', ->
  document.getElementById('primary-content').className += 'animated fadeIn'

document.addEventListener 'page:fetch', ->
  document.getElementById('primary-content').className += 'animated fadeOut'