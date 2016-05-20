class PubsController < ApplicationController
  attr_reader :name, :address1, :address2, :city, :state, :zip, :phone, :fax, :email, :website, :pub_user_id

  def index
    @pubs = Pub.all
    owner_pubs = params[:owner]
    if current_pub_user && owner_pubs
    @pubs = Pub.where(pub_user_id: current_pub_user.id) 
    end      
    search_for = params[:search].downcase if params[:search]
    if search_for
      @pubs = Pub.where("lower(name) LIKE ? OR lower(address1) LIKE ? OR lower(city) LIKE ?", "%#{search_for}%", "%#{search_for}%", "%#{search_for}%")
    end

    
  end

  def main
    render 'main.html.erb'
  end

  def show
    @users = UserLogin.all
    @reviews = Review.where(pub_id: params[:id])
    @pub = Pub.find_by(id: params[:id])
    @photos = PubPhoto.where(pub_id: params[:id])
    @games = PubGame.where(pub_id: params[:id]).order('date')
    render 'show.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    @pub = Pub.new(
      name: params[:name],
      description: params[:description],
      address1: params[:address1],
      address2: params[:address2],
      city: params[:city],
      zip: params[:zip],
      state: params[:state],
      phone: params[:phone],
      fax: params[:fax],
      email: params[:email],
      website: params[:website],
      pub_user_id: current_pub_user.id
    )
    @pub.save

    pub_photo = PubPhoto.new(
      file: params[:file],
      pub_id: @pub.id
    )
    pub_photo.save
    redirect_to "/pubs/#{@pub.id}"

    # if @pub.save
    #   flash[:success] = "Your listing was successfully created"
    #   redirect_to "pubs/#{@pub.id}"
    # else
    #   render "new.html.erb"
    # end
  end

  def edit
    @pub = Pub.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    @pub = Pub.find_by(id: params[:id])
    @pub.update(
      name: params[:name],
      description: params[:description],
      address1: params[:address1],
      address2: params[:address2],
      city: params[:city],
      zip: params[:zip],
      state: params[:state],
      phone: params[:phone],
      fax: params[:fax],
      email: params[:email],
      website: params[:website]
    )
    pub_photo = PubPhoto.where(pub_id: @pub.id)
    if pub_photo.length > 3
      pub_photo[0].destroy
    end
    pub_photo = PubPhoto.new(
      file: params[:file],
      pub_id: @pub.id
    )
    puts "*" * 20
    p pub_photo
    p @pub.id
    puts "*" * 20
    pub_photo.save
    redirect_to "/pubs?owner=mypubs"
  end
end
