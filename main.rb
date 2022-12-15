require 'sinatra'
require 'bcrypt'
require 'gon-sinatra'
require './db/db'

enable :sessions
Sinatra::register Gon::Sinatra

# CONTROLLERS
require './controllers/sessions_controller'
require './controllers/notes_controller'
require './controllers/temp_notes_controller'
require './controllers/users_controller'
require './controllers/calendar_controller'
require './controllers/credit_controller'

# MODELS

require './models/note'
require './models/user'

# HELPERS
require './helpers/sessions_helper'