Consense::Engine.routes.draw do
  get 'prompt_consent/:name/:user_id',
      to: 'consents#prompt',
      as: :prompt_consent

  get 'approve/:name/:user_id',
      to: 'consents#approve',
      as: :approve

  get 'deny/:name/:user_id',
      to: 'consents#deny',
      as: :deny
end
