Consent::Engine.routes.draw do
  get 'prompt_consent/:name/:user_id',
      to: 'consents#prompt',
      as: :prompt_consent

  put 'approve/:name/:user_id',
      to: 'consents#approve',
      as: :approve

  put 'deny/:name/:user_id',
      to: 'consents#deny',
      as: :deny
end
