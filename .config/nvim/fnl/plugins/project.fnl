(local M {1 :ahmedkhalf/project.nvim
          :commit :685bc8e3890d2feb07ccf919522c97f7d33b94e4
          :dependencies [{1 :nvim-telescope/telescope.nvim
                          :cmd [:Telescope]
                          :commit :203bf5609137600d73e8ed82703d6b0e320a5f36
                          :event :Bufenter}]})
(fn M.config []
  (let [project (require :project_nvim)]
    (project.setup {:detection_methods [:pattern]
                    :patterns [:.git :Makefile :package.json]})
    (local telescope (require :telescope))
    (telescope.load_extension :projects)))
M	
