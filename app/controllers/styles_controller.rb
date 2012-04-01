class StylesController < ApplicationController
  before_filter :factory

  def index
      @title = "Styles"
      @styles = Style.search(params[:search])
    end

    def new
      @title = "New Style"
      @style = Style.new
    end

    def create
      @style=Style.new(params[:style])
      if @style.save
        flash[:success] = "Style " + @style.style + "|" + @style.construction + " created!"
        redirect_to styles_path
      else
        @title = "New Style"
        render 'new'
      end
    end

    def edit
      @title = "Edit Style"
      @style = Style.find(params[:id])
    end

    def update
      @style = Style.find(params[:id])
      if @style.update_attributes(params[:style])
        flash[:success] = "Style details updated!"
        redirect_to styles_path
      else
        @title = "Edit Style"
        render 'edit'
      end
    end

    def destroy
      @style = Style.find(params[:id])
      if @style.items.count == 0
        @style.destroy
        flash[:success] = "Style deleted!"
        redirect_to styles_path
      else
        flash[:error] = "Style can't be deleted, there are items related to this style"
        redirect_to styles_path
      end
    end

end
