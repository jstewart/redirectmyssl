module RedirectsHelper
  def with_built_host(redirect)
    redirect.hosts.build
    redirect
  end
end
