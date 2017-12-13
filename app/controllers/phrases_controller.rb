class PhrasesController < ApplicationController
  # TODO: Move all the DB calls away from the controller
  def index
    # TODO: Call this Interactor in a rake task, not the controller
    GeneratePhrases.new.perform
    
    if session[:current_count].nil?
      session[:current_count] = 10
      session[:ids_left] = Phrase.all.map(&:id)
      session[:current_ids] = []
    end
  end

  def show_random
    index = rand(session[:current_count])
    id = session[:ids_left][index]
    phrase = Phrase.find_by_id(id)

    session[:current_count] -= 1
    session[:ids_left].delete(id)
    session[:current_ids].push(id)

    @phrase = phrase.value
    respond_to { |format| format.js }
  end

  def clear
    session[:current_count] = 10
    session[:ids_left] = Phrase.all.map(&:id)
    session[:current_ids] = []

    respond_to { |format| format.js }
  end
end
