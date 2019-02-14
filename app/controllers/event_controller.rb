class EventController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def index
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new

  end

  def create

    @event = Event.create('title' => params[:title],
      'description' => params[:description],
     'duration' => params[:duration],
     'price' => params[:price],
     'location' => params[:location],
     'start_date' => params[:start_date],
      'duration' => params[:duration],
      'user_id' => current_user.id)


      if @event.save # essaie de sauvegarder en base
            # si ça marche, il redirige vers la page d'index du site
            flash[:success] = "Event bien créé !"
            redirect_to event_index_path
           else
            # sinon, il render la view new (qui est celle sur laquelle on est déjà)
             render new_event_path
      end

    end

      def edit
        @event = Event.find(params[:id])
      end

      def update
        @event = Event.find(params[:id])
        post_params = params.require(:event).permit(:title, :description, :start_date, :duration, :price, :location)
        @event.update(post_params)
        if @event.update(post_params)
          redirect_to current_user
        else
          render :edit
        end
      end

      def destroy
          @event = Event.find(params[:id])
          @event.destroy
          redirect_to event_index_path

      end
end
