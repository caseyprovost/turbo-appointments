import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

// import Flatpickr
import Flatpickr from 'stimulus-flatpickr'

// Manually register Flatpickr as a stimulus controller
application.register('flatpickr', Flatpickr)

export { application }
