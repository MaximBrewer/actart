<?php

namespace App\Notifications;

use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Auth\Notifications\ResetPassword as Notification;

class ResetPassword extends Notification
{
    /**
     * Build the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        return (new MailMessage)
            ->subject('Act-Art.ru - смена пароля')
            ->greeting("Запрос о смене пароля на сайте.")
            ->action('Смена пароля', url(config('app.url') . '/password/reset/' . $this->token) . '?email=' . urlencode($notifiable->email));
    }
}
