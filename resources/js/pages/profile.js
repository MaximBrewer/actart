import React from 'react';

function Profile() {
  return (
    <section className="profile-section">
      <div className="container">
        <div className="row announce">
          <div className="col col-xl-40 col-xxl-38">
            <h5 className="h5">{__('You wanted to take part in the auctions:')}</h5>
            <div id="actAuctionsProfile"></div>
          </div>
          <div className="col col-xl-20 col-xxl-22">
            <h5 className="h5">{__('Profile data')}</h5>
            <hr />
            <dl>
              <dt>{__('Your ID:')}</dt>
              <dd>#{user.id}</dd>
            </dl>
            <dl>
              <dt>{__('Status:')}</dt>
              <dd>{__(user.role.display_name)}</dd>
            </dl>
            <dl>
              <dt>{__('Full name:')}</dt>
              <dd>{user.name + ` ` + user.surname}</dd>
            </dl>
            <dl>
              <dt>{__('Логин:')}</dt>
              <dd>{user.email}</dd>
            </dl>
            <hr />
          </div>
        </div>
        <div className="art-waterfall-wrapper py-5">
          <h5 className="h5">{__('Favorites:')}</h5>
          <div className="act-waterfall" data-entity="favorites" data-action="add" data-tizer-view="gallery"
            data-view='{"xs":1,"sm":2,"md":2,"lg":3,"xl":3,"xxl":4}'
            data-limit='{"xs":48,"sm":48,"md":48,"lg":48,"xl":48,"xxl":48}'>
          </div>
        </div>
      </div>
    </section>
  );
}

export default Profile;
