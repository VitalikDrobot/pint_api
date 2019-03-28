# frozen_string_literal: true

class Api::V1::PinsController < ApplicationController
  before_action :find_pin, only: %i[show edit update destroy upvote]

  def cloudinary_data
    @cloudinary_data = Cloudinary::Uploader.upload(*uploadParams)
  end

  def index
    @pins = Pin.all
    render json: @pins
  end

  def show
    render json: @pin
  end

  def new
    @pin = current_user.pins.build
  end

  def create
    @pin = current_user.pins.build(pin_params)

    if @pin.save
      render json: @pin, status: :created, location: api_v1_pin_url(@pin)
    else
      render json: @pin.errors, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @pin.update(pin_params)
      render json: @pin
    else
      render json: @pin.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @pin.destroy
  end

  def upvote
    @pin.upvote_by current_user
    render json: @pin
  end

  private

  def pin_params
    params.require(:pin).permit(:title, :description, :image)
  end

  def find_pin
    @pin = Pin.find(params[:id])
  end
end
