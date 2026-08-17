" Support Sway's `set { ... }` block syntax.
syntax region swayConfigSetBlock
      \ transparent
      \ start=/^\s*set\s\+{$/
      \ end=/^\s*}$/
      \ contains=i3ConfigKeyword,i3ConfigParen,i3ConfigSet,i3ConfigComment
      \ fold
      \ keepend
