<?php

namespace App\Notifications\Manager;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class GalleryBlitz extends Notification
{
    use Queueable;

    protected $bet;
    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct($bet)
    {
        $this->bet = $bet;
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
            ->subject('Act-Art.ru - Заявка на Блиц-покупку')
            ->greeting("Заявка на Блиц-покупку на сайте Act-Art.ru.")
            ->line('Лот: ' . $this->bet->lot->title)
            ->line('Ставка: ' . $this->bet->bet . '$')
            ->action('Посмотреть', "https://act-art.ru/admin/lots/" . $this->bet->lot->id)
            ->line('Пользователь: #' . $this->bet->user->id)
            ->line('E-mail: ' . $this->bet->user->email)
            ->line('Телефон: ' . $this->bet->user->phone)
            ->action('Посмотреть', "https://act-art.ru/admin/users/" . $this->bet->user->id);
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
