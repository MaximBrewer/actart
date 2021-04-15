<?php

namespace App\Notifications\Manager;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;


class Participate extends Notification
{
    use Queueable;

    protected $auction;
    protected $user;
    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct($auction, $user)
    {
        $this->auction = $auction;
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
            ->subject('Act-Art.ru - новая регистрация на аукцион')
            ->greeting("Пользователь запланировал участие в аукционе.")
            ->line('Аукцион состоится: ' . $this->auction->dateout)
            ->line('ID пользователя: ' . $this->user->id)
            ->line('E-mail пользователя: ' . $this->user->email)
            ->line('VIP-статус: ' . $this->user->vip ? 'Да' : 'Нет')
            ->action('Перейти к пользователю', "https://act-art.ru/admin/users/" . $this->user->id)
            ->action('Перейти к аукциону', "https://act-art.ru/auctions/" . $this->auction->id);
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
