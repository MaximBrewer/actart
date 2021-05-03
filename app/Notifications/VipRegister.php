<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class VipRegister extends Notification
{
    use Queueable;

    protected $user;
    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct($user)
    {
        $this->user = $user;
        //
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        return (new MailMessage)
            ->subject('Act-Art.ru - VIP-статус')
            ->greeting("Вам присвоен VIP-статус")
            ->line('Теперь вы можете участвовать во всех аукционах и делать ставки в Галерее Акт-арт без ограничений.')
            ->line('Ваш профиль обновлен.')
            ->action('Перейти', url(config('app.url') . '/profile'));
            

        // 2) Письмо пользователю после VIP регистрации
        // VIP-регистрация на сайте ACT-ART
        // Вы подали заявку на VIP-регистрацию на сайте act-art.ru
        // После проверки данных с вас будут сняты ограничения на участие в аукционах.
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            //
        ];
    }
}
