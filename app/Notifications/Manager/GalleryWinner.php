<?php

namespace App\Notifications\Manager;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;
use App\User;

class GalleryWinner extends Notification
{
    use Queueable;

    protected $lot;
    protected $user;
    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct($lot, $user)
    {
        $this->lot = $lot;
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
            ->subject('Act-Art.ru - покупка лота')
            ->greeting("Покупка лота на сайте Act-Art.ru.")
            ->line('Лот: ' . $this->lot->title)
            ->line('Ставка: ' . $this->lot->bets[0]->bet . '₽')
            ->action('Посмотреть', "http://act-art.ru/admin/lots/" . $this->lot->id)
            ->line('Пользователь: ' . $this->user->id)
            ->line('E-mail: ' . $this->user->email)
            ->line('Телефон: ' . $this->user->phone)
            ->action('Посмотреть', "http://act-art.ru/admin/users/" . $this->user->id);
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
