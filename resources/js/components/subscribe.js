import React from 'react';
import { useAuth } from '../context/auth';
import __ from '../utils/trans';
import { Mail } from '../icons/footer'

export default function Subscribe() {
    let { currentUser } = useAuth();

    return (
        <form>
            <div className="form-group mb-0">
                <label htmlFor="subscribeFooterEmail">{__('Be the first to know about new lots, special offers, new exhibitions in our mailing list')}</label>
                <div className="input-group">
                    <div className="input-group-prepend d-none d-lg-block">
                        <Mail />
                    </div>
                    <input type="email" className="form-control" aria-describedby="email" placeholder={__('Your E-mail')} id="subscribeFooterEmail" />
                </div>
            </div>
        </form>
    );
}
