require "serverspec"
require "docker"

describe "Docker NGINX image" do
  before(:all) do
    @image = Docker::Image.build_from_dir('.')

    set :os, family: :debian
    set :backend, :docker
    set :docker_image, @image.id
  end

  it "installs Debian Jessie" do
    expect(debian_version).to include("8.")
  end

  def debian_version
    command("cat /etc/debian_version").stdout
  end

end
