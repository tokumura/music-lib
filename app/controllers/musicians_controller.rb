class MusiciansController < ApplicationController
  # GET /musicians
  # GET /musicians.xml
  def index
    @musicians = Musician.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @musicians }
    end
  end

  # GET /musicians/1
  # GET /musicians/1.xml
  def show
    @musician = Musician.find(params[:id])
    puts "musician.music"
    puts @musician.music


    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @musician }
    end
  end

  # GET /musicians/new
  # GET /musicians/new.xml
  def new
    @musician = Musician.new
    @music = Music.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @musician }
    end
  end

  # GET /musicians/1/edit
  def edit
    @musician = Musician.find(params[:id])
  end

  # POST /musicians
  # POST /musicians.xml
  def create
    @musician = Musician.new(params[:musician])
    @music = Music.new(params[:music])
    save_success = @musician.save
    if (save_success)
      @music.musician_id = @musician.id
      save_success = @music.save
    end

    respond_to do |format|
      #if @musician.save
      if save_success
        puts "@musician.id"
        puts @musician.id
        format.html { redirect_to(@musician, :notice => 'Musician was successfully created.') }
        format.xml  { render :xml => @musician, :status => :created, :location => @musician }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @musician.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /musicians/1
  # PUT /musicians/1.xml
  def update
    @musician = Musician.find(params[:id])

    respond_to do |format|
      if @musician.update_attributes(params[:musician])
        format.html { redirect_to(@musician, :notice => 'Musician was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @musician.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /musicians/1
  # DELETE /musicians/1.xml
  def destroy
    @musician = Musician.find(params[:id])
    @musics = Music.find_all_by_musician_id(@musician.id)
    @musics.each do |music|
      music.destroy
    end
    @musician.destroy

    respond_to do |format|
      format.html { redirect_to(musicians_url) }
      format.xml  { head :ok }
    end
  end
end
