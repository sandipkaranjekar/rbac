module Rbac
  class RolesController < ApplicationController
    before_action :set_role, only: [:show, :edit, :update, :destroy]

    # GET /roles
    # GET /roles.json
    def index
      @roles = Rbac::Role.all
    end

    # GET /roles/1
    # GET /roles/1.json
    def show
    end

    # GET /roles/new
    def new
      @role = Rbac::Role.new
      @groups = Rbac::Group.where("is_active = ?", true)
    end

    # GET /roles/1/edit
    def edit
      @groups = Rbac::Group.where("is_active = ?", true)
      @role_groups = @role.groups
    end

    # POST /roles
    # POST /roles.json
    def create
      @role = Rbac::Role.new(role_params)

      respond_to do |format|
        if @role.save
          @role.groups = Rbac::Group.where(id: params[:group_ids])
          format.html { redirect_to rbac_roles_path, notice: 'Role was successfully created.' }
          format.json { render :show, status: :created, location: @role }
        else
          format.html { redirect_to new_rbac_role_path }
          format.json { render json: @role.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /roles/1
    # PATCH/PUT /roles/1.json
    def update
      respond_to do |format|
        if @role.update(role_params)
          @role.groups = Rbac::Group.where(id: params[:group_ids])
          format.html { redirect_to rbac_roles_path, notice: 'Role was successfully updated.' }
          format.json { render :show, status: :ok, location: @role }
        else
          format.html { redirect_to edit_rbac_role_path }
          format.json { render json: @role.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /roles/1
    # DELETE /roles/1.json
    def destroy
      @role.destroy
      respond_to do |format|
        format.html { redirect_to rbac_roles_url, notice: 'Role was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_role
        @role = Rbac::Role.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def role_params
        params.require(:rbac_role).permit(:role_name, :role_description, :is_active, :group_ids)
      end
  end
end
