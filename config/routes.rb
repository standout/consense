Consent::Engine.routes.draw do
  put 'approve/:name/:user_id',
      to: 'consents#approve',
      as: :approve

  put 'deny/:name/:user_id',
      to: 'consents#deny',
      as: :deny
end
