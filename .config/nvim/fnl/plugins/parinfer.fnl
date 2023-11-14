{1 :eraserhd/parinfer-rust
 :build "cargo build --release"
 :config (fn [] (set vim.g.parinfer_mode :paren))
 :enabled true
 :ft [:clojure]
 :name :parinfer}	
