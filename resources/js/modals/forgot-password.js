import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import { forgotPassword } from '../api/auth';
import useInputValue from '../components/input-value';
import __ from '../utils/trans';

function ForgotPasswordModal(props) {
  const { openModal, closeModal } = props;
  let [resetFeedback, setResetFeedback] = useState('');
  let email = useInputValue('email');

  const handleSubmit = e => {
    e.preventDefault();

    forgotPassword({ email: email.value })
      .then(status => setResetFeedback(status))
      .catch(error => {
        error.json().then(({ errors }) => {
          email.parseServerError(errors);
        });
      });
  };

  return (
    <div className={`modal-content`}>
      <div className="modal-header">
        <h5 className="modal-title">{__('MODAL_FP_H2')}</h5>
        <button type="button" className="close" onClick={closeModal}>
          <span aria-hidden="true">×</span>
        </button>
        {
          resetFeedback && (
            <div role="alert">
              <p> {resetFeedback}</p>
            </div>)
        }
      </div>
      <form onSubmit={handleSubmit} method="POST">
        <div className={`modal-body`}>

          <div className="form-group">
            <label htmlFor="email">{__('MODAL_FP_EMAIL')}</label>
            <input
              id="email"
              type="email"
              name="email"
              className={`form-control ${email.error ? 'is-invalid' : ''}`}
              required
              autoFocus
              {...email.bind}
            />
            {email.error && <div className="invalid-feedback">{email.error}</div>}
          </div>
          <div className="form-group">
            <a href="#" onClick={() => openModal('login')}>{__('MODAL_FORGET_PASSWORD_LOGIN')}</a>
          </div>
        </div>
        <div className={`modal-footer`}>
          <div className="form-group">
            <button type="submit" className="btn btn-primary">{__('MODAL_FP_BTN')}</button>
          </div>
        </div>
      </form>
    </div>
  );
}

export default ForgotPasswordModal;
