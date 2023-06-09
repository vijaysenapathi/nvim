_DJANGO_SETUP = nil

local function django_setup(details)
  _DJANGO_SETUP = {
    settings = details.settings or nil,
    env = details.env or { editor = "nvim" },
    manage_py = details.manage_py or "manage.py",
    wd = details.wd
  }
end


local function run_django_command (name, command, command_args)
  if _DJANGO_SETUP == nil then
    error("Call DjangoSetup before running any django command")
  end

  RunCommand( name, "python", {
    args = {
      _DJANGO_SETUP.manage_py,
      command,
      unpack(command_args)
    },
    wd = _DJANGO_SETUP.wd,
    env = _DJANGO_SETUP.env
  })
end


SetupDjango = django_setup
RunDjangoCommand = run_django_command

